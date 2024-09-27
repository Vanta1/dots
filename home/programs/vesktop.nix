{...}: {
  xdg.configFile."vesktop/themes/midnight.theme.css".text = ''
    /**
    * @name midnight
    * @description A dark, rounded discord theme.
    * @author refact0r
    * @version 1.6.2
    * @invite nz87hXyvcy
    * @website https://github.com/refact0r/midnight-discord
    * @source https://github.com/refact0r/midnight-discord/blob/master/midnight.theme.css
    * @authorId 508863359777505290
    * @authorLink https://www.refact0r.dev
    */

    /* IMPORTANT: make sure to enable dark mode in discord settings for the theme to apply properly!!! */

    @import url('https://refact0r.github.io/midnight-discord/midnight.css');

    /* customize things here */
    :root {
    	/* font, change to 'gg sans' for default discord font*/
    	--font: 'InputSans-Thin';

    	/* top left corner text */
    	--corner-text: 'Midnight';

    	/* color of status indicators and window controls */
    	--online-indicator: #a7c080; /* change to #23a55a for default green */
    	--dnd-indicator: #e67e80; /* change to #f13f43 for default red */
    	--idle-indicator: #dbbc7f; /* change to #f0b232 for default yellow */
    	--streaming-indicator: #d699b6; /* change to #593695 for default purple */

    	/* accent colors */
    	--accent-1: hsl(172, 31%, 54%); /* links */
    	--accent-2: hsl(172, 31%, 58%); /* general unread/mention elements */
    	--accent-3: hsl(172, 31%, 62%); /* accent buttons */
    	--accent-4: hsl(172, 31%, 66%); /* accent buttons when hovered */
    	--accent-5: hsl(172, 31%, 70%); /* accent buttons when clicked */
    	--mention: hsla(190, 80%, 82%, 0.1); /* mentions & mention messages */
    	--mention-hover: hsla(190, 80%, 52%, 0.05); /* mentions & mention messages when hovered */

    	/* text colors */
    	--text-0: white; /* text on colored elements */
    	--text-1: var(--text-2); /* other normally white text */
    	--text-2: #d3c6aa; /* headings and important text */
    	--text-3: #d3c6aa; /* normal text */
    	--text-4: #859289; /* icon buttons and channels */
    	--text-5: #414b50; /* muted channels/chats and timestamps */

    	/* background and dark colors */
    	--bg-1: hsl(202, 12%, 9%); /* dark buttons when clicked */
    	--bg-2: #1e2326; /* dark buttons */
    	--bg-3: #2e383c; /* spacing, secondary elements */
    	--bg-4: #272e33; /* main background color */
    	--hover: hsla(230, 20%, 40%, 0.1); /* channels and buttons when hovered */
    	--active: hsla(220, 20%, 40%, 0.2); /* channels and buttons when clicked or selected */
    	--message-hover: hsla(220, 0%, 0%, 0.1); /* messages when hovered */

    	/* amount of spacing and padding */
    	--spacing: 0px;

    	/* animations */
    	/* ALL ANIMATIONS CAN BE DISABLED WITH REDUCED MOTION IN DISCORD SETTINGS */
    	--list-item-transition: 0.2s ease; /* channels/members/settings hover transition */
    	--unread-bar-transition: 0.2s ease; /* unread bar moving into view transition */
    	--moon-spin-transition: 2.4s ease; /* moon icon spin */
    	--icon-spin-transition: 1s ease; /* round icon button spin (settings, emoji, etc.) */

    	/* corner roundness (border-radius) */
    	--roundness-xl: 0px; /* roundness of big panel outer corners */
    	--roundness-l: 10px; /* popout panels */
    	--roundness-m: 8px; /* smaller panels, images, embeds */
    	--roundness-s: 6px; /* members, settings inputs */
    	--roundness-xs: 4px; /* channels, buttons */
    	--roundness-xxs: 2px; /* searchbar, small elements */

    	/* direct messages moon icon */
    	/* change to block to show, none to hide */
    	--discord-icon: none; /* discord icon */
    	--moon-icon: block; /* moon icon */
    	--moon-icon-url: url('https://upload.wikimedia.org/wikipedia/commons/c/c4/Font_Awesome_5_solid_moon.svg'); /* custom icon url */
    	--moon-icon-size: auto;

    	/* filter uncolorable elements to fit theme */
    	/* (just set to none, they're too much work to configure) */
    	--login-bg-filter: saturate(0.3) hue-rotate(-15deg) brightness(0.4); /* login background artwork */
    	--green-to-accent-3-filter: hue-rotate(56deg) saturate(1.43); /* add friend page explore icon */
    	--blurple-to-accent-3-filter: hue-rotate(304deg) saturate(0.84) brightness(1.2); /* add friend page school icon */
    }
  '';
}
