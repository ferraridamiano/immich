<script lang="ts">
  import { autoGrowHeight } from '$lib/actions/autogrow';
  import { shortcut } from '$lib/actions/shortcut';
  import Icon from '$lib/components/elements/icon.svelte';
  import ButtonContextMenu from '$lib/components/shared-components/context-menu/button-context-menu.svelte';
  import MenuOption from '$lib/components/shared-components/context-menu/menu-option.svelte';
  import { AppRoute, timeBeforeShowLoadingSpinner } from '$lib/constants';
  import { activityManager } from '$lib/managers/activity-manager.svelte';
  import { locale } from '$lib/stores/preferences.store';
  import { getAssetThumbnailUrl } from '$lib/utils';
  import { getAssetType } from '$lib/utils/asset-utils';
  import { handleError } from '$lib/utils/handle-error';
  import { isTenMinutesApart } from '$lib/utils/timesince';
  import { ReactionType, type ActivityResponseDto, type AssetTypeEnum, type UserResponseDto } from '@immich/sdk';
  import { IconButton } from '@immich/ui';
  import { mdiClose, mdiDeleteOutline, mdiDotsVertical, mdiHeart, mdiSend } from '@mdi/js';
  import * as luxon from 'luxon';
  import { t } from 'svelte-i18n';
  import LoadingSpinner from '../shared-components/loading-spinner.svelte';
  import { NotificationType, notificationController } from '../shared-components/notification/notification';
  import UserAvatar from '../shared-components/user-avatar.svelte';

  const units: Intl.RelativeTimeFormatUnit[] = ['year', 'month', 'week', 'day', 'hour', 'minute', 'second'];

  const shouldGroup = (currentDate: string, nextDate: string): boolean => {
    const currentDateTime = luxon.DateTime.fromISO(currentDate, { locale: $locale });
    const nextDateTime = luxon.DateTime.fromISO(nextDate, { locale: $locale });

    return currentDateTime.hasSame(nextDateTime, 'hour') || currentDateTime.toRelative() === nextDateTime.toRelative();
  };

  const timeSince = (dateTime: luxon.DateTime) => {
    const diff = dateTime.diffNow().shiftTo(...units);
    const unit = units.find((unit) => diff.get(unit) !== 0) || 'second';

    const relativeFormatter = new Intl.RelativeTimeFormat($locale, {
      numeric: 'auto',
    });
    return relativeFormatter.format(Math.trunc(diff.as(unit)), unit);
  };

  interface Props {
    user: UserResponseDto;
    assetId?: string | undefined;
    albumId: string;
    assetType?: AssetTypeEnum | undefined;
    albumOwnerId: string;
    disabled: boolean;
    onClose: () => void;
  }

  let { user, assetId = undefined, albumId, assetType = undefined, albumOwnerId, disabled, onClose }: Props = $props();

  let innerHeight: number = $state(0);
  let activityHeight: number = $state(0);
  let chatHeight: number = $state(0);
  let divHeight: number = $state(0);
  let previousAssetId: string | undefined = $state(assetId);
  let message = $state('');
  let isSendingMessage = $state(false);

  const timeOptions: Intl.DateTimeFormatOptions = {
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit',
    hour12: false,
  };

  const handleDeleteReaction = async (reaction: ActivityResponseDto, index: number) => {
    try {
      await activityManager.deleteActivity(reaction, index);

      const deleteMessages: Record<ReactionType, string> = {
        [ReactionType.Comment]: $t('comment_deleted'),
        [ReactionType.Like]: $t('like_deleted'),
      };
      notificationController.show({
        message: deleteMessages[reaction.type],
        type: NotificationType.Info,
      });
    } catch (error) {
      handleError(error, $t('errors.unable_to_remove_reaction'));
    }
  };

  const handleSendComment = async () => {
    if (!message) {
      return;
    }
    const timeout = setTimeout(() => (isSendingMessage = true), timeBeforeShowLoadingSpinner);
    try {
      await activityManager.addActivity({ albumId, assetId, type: ReactionType.Comment, comment: message });

      message = '';
    } catch (error) {
      handleError(error, $t('errors.unable_to_add_comment'));
    } finally {
      clearTimeout(timeout);
    }
    isSendingMessage = false;
  };
  $effect(() => {
    if (innerHeight && activityHeight) {
      divHeight = innerHeight - activityHeight;
    }
  });
  $effect(() => {
    if (assetId && previousAssetId != assetId) {
      previousAssetId = assetId;
    }
  });

  const onsubmit = async (event: Event) => {
    event.preventDefault();
    await handleSendComment();
  };
</script>

<div class="overflow-y-hidden relative h-full border-l border-subtle bg-subtle" bind:offsetHeight={innerHeight}>
  <div class="w-full h-full">
    <div class="flex w-full h-fit dark:text-immich-dark-fg p-2 bg-subtle" bind:clientHeight={activityHeight}>
      <div class="flex place-items-center gap-2">
        <IconButton
          shape="round"
          variant="ghost"
          color="secondary"
          onclick={onClose}
          icon={mdiClose}
          aria-label={$t('close')}
        />

        <p class="text-lg text-immich-fg dark:text-immich-dark-fg">{$t('activity')}</p>
      </div>
    </div>
    {#if innerHeight}
      <div
        class="overflow-y-auto immich-scrollbar relative w-full px-2"
        style="height: {divHeight}px;padding-bottom: {chatHeight}px"
      >
        {#each activityManager.activities as reaction, index (reaction.id)}
          {#if reaction.type === ReactionType.Comment}
            <div class="flex dark:bg-gray-800 bg-gray-200 py-3 ps-3 mt-3 rounded-lg gap-4 justify-start">
              <div class="flex items-center">
                <UserAvatar user={reaction.user} size="sm" />
              </div>

              <div class="w-full leading-4 overflow-hidden self-center break-words text-sm">{reaction.comment}</div>
              {#if assetId === undefined && reaction.assetId}
                <a class="aspect-square w-[75px] h-[75px]" href="{AppRoute.ALBUMS}/{albumId}/photos/{reaction.assetId}">
                  <img
                    class="rounded-lg w-[75px] h-[75px] object-cover"
                    src={getAssetThumbnailUrl(reaction.assetId)}
                    alt="Profile picture of {reaction.user.name}, who commented on this asset"
                  />
                </a>
              {/if}
              {#if reaction.user.id === user.id || albumOwnerId === user.id}
                <div class="me-4">
                  <ButtonContextMenu
                    icon={mdiDotsVertical}
                    title={$t('comment_options')}
                    align="top-right"
                    direction="left"
                    size="small"
                  >
                    <MenuOption
                      activeColor="bg-red-200"
                      icon={mdiDeleteOutline}
                      text={$t('remove')}
                      onClick={() => handleDeleteReaction(reaction, index)}
                    />
                  </ButtonContextMenu>
                </div>
              {/if}
            </div>

            {#if (index != activityManager.activities.length - 1 && !shouldGroup(activityManager.activities[index].createdAt, activityManager.activities[index + 1].createdAt)) || index === activityManager.activities.length - 1}
              <div
                class="pt-1 px-2 text-right w-full text-sm text-gray-500 dark:text-gray-300"
                title={new Date(reaction.createdAt).toLocaleDateString(undefined, timeOptions)}
              >
                {timeSince(luxon.DateTime.fromISO(reaction.createdAt, { locale: $locale }))}
              </div>
            {/if}
          {:else if reaction.type === ReactionType.Like}
            <div class="relative">
              <div class="flex py-3 ps-3 mt-3 gap-4 items-center text-sm">
                <div class="text-red-600"><Icon path={mdiHeart} size={20} /></div>

                <div class="w-full" title={`${reaction.user.name} (${reaction.user.email})`}>
                  {$t('user_liked', {
                    values: {
                      user: reaction.user.name,
                      type: assetType ? getAssetType(assetType).toLowerCase() : null,
                    },
                  })}
                </div>
                {#if assetId === undefined && reaction.assetId}
                  <a
                    class="aspect-square w-[75px] h-[75px]"
                    href="{AppRoute.ALBUMS}/{albumId}/photos/{reaction.assetId}"
                  >
                    <img
                      class="rounded-lg w-[75px] h-[75px] object-cover"
                      src={getAssetThumbnailUrl(reaction.assetId)}
                      alt="Profile picture of {reaction.user.name}, who liked this asset"
                    />
                  </a>
                {/if}
                {#if reaction.user.id === user.id || albumOwnerId === user.id}
                  <div class="me-4">
                    <ButtonContextMenu
                      icon={mdiDotsVertical}
                      title={$t('reaction_options')}
                      align="top-right"
                      direction="left"
                      size="small"
                    >
                      <MenuOption
                        activeColor="bg-red-200"
                        icon={mdiDeleteOutline}
                        text={$t('remove')}
                        onClick={() => handleDeleteReaction(reaction, index)}
                      />
                    </ButtonContextMenu>
                  </div>
                {/if}
              </div>
              {#if (index != activityManager.activities.length - 1 && isTenMinutesApart(activityManager.activities[index].createdAt, activityManager.activities[index + 1].createdAt)) || index === activityManager.activities.length - 1}
                <div
                  class="pt-1 px-2 text-right w-full text-sm text-gray-500 dark:text-gray-300"
                  title={new Date(reaction.createdAt).toLocaleDateString(navigator.language, timeOptions)}
                >
                  {timeSince(luxon.DateTime.fromISO(reaction.createdAt, { locale: $locale }))}
                </div>
              {/if}
            </div>
          {/if}
        {/each}
      </div>
    {/if}
  </div>

  <div class="absolute w-full bottom-0">
    <div class="flex items-center justify-center p-2" bind:clientHeight={chatHeight}>
      <div class="flex p-2 gap-4 h-fit bg-gray-200 text-immich-dark-gray rounded-3xl w-full">
        <div>
          <UserAvatar {user} size="md" noTitle />
        </div>
        <form class="flex w-full max-h-56 gap-1" {onsubmit}>
          <div class="flex w-full items-center gap-4">
            <textarea
              {disabled}
              bind:value={message}
              use:autoGrowHeight={{ height: '5px', value: message }}
              placeholder={disabled ? $t('comments_are_disabled') : $t('say_something')}
              use:shortcut={{
                shortcut: { key: 'Enter' },
                onShortcut: () => handleSendComment(),
              }}
              class="h-[18px] {disabled
                ? 'cursor-not-allowed'
                : ''} w-full max-h-56 pe-2 items-center overflow-y-auto leading-4 outline-none resize-none bg-gray-200"
            ></textarea>
          </div>
          {#if isSendingMessage}
            <div class="flex items-end place-items-center pb-2 ms-0">
              <div class="flex w-full place-items-center">
                <LoadingSpinner />
              </div>
            </div>
          {:else if message}
            <div class="flex items-end w-fit ms-0">
              <IconButton
                shape="round"
                aria-label={$t('send_message')}
                size="small"
                variant="ghost"
                icon={mdiSend}
                class="dark:text-immich-dark-gray"
                onclick={() => handleSendComment()}
              />
            </div>
          {/if}
        </form>
      </div>
    </div>
  </div>
</div>

<style>
  ::placeholder {
    color: rgb(60, 60, 60);
    opacity: 0.6;
  }

  ::-ms-input-placeholder {
    /* Edge 12 -18 */
    color: white;
  }
</style>
