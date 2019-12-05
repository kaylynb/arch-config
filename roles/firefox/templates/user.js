{% if firefox_dpi_scale is defined %}
// Setup DPI
user_pref("layout.css.devPixelsPerPx", "{{ firefox_dpi_scale }}");
{% endif %}

// Fullscreen shouldn't animate. Just no.
user_pref("toolkit.cosmeticAnimations.enabled", false);

// Allow user stylesheets
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Select arc theme (this will get nuked if user.js is updated)
user_pref("general.skins.selectedSkin", "arc-darker-theme");

// Disable 'first run' page on startup
user_pref("browser.startup.homepage_override.mstone","ignore");

user_pref("browser.startup.homepage", "about:blank");
user_pref("browser.newtab.url", "about:blank");
user_pref("browser.newtabpage.enabled", false);

// Don't warn on closing tabs
user_pref("browser.tabs.warnOnClose", false);

// Use native titlebar
user_pref("browser.tabs.drawInTitlebar", false);

// Disable middle mouse from opening pasted text
user_pref("middlemouse.contentLoadURL", false);

// Use multiple process windows
user_pref("dom.ipc.processCount", 7);

user_pref("security.webauth.u2f", true);

user_pref("browser.ctrlTab.recentlyUsedOrder", false);

user_pref("browser.pocket.enabled", false);
user_pref("extensions.pocket.enabled", false);
// PREF: Disable "Recommended by Pocket" in Firefox Quantum
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories",	false);

// PREF: Disable Extension recommendations (Firefox >= 65)
// https://support.mozilla.org/en-US/kb/extension-recommendations
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr", false);
//
// PREF: Disable the UITour backend
// https://trac.torproject.org/projects/tor/ticket/19047#comment:3
user_pref("browser.uitour.enabled", false);

user_pref("browser.uidensity", 1);

// PREF: Always ask the user where to download
// https://developer.mozilla.org/en/Download_Manager_preferences (obsolete)
user_pref("browser.download.useDownloadDir",			false);

// user_pref("browser.tabs.opentabfor.middleclick", false);
// user_pref("browser.link.open_newwindow", 1);
// user_pref("browser.link.open_external", 2);
