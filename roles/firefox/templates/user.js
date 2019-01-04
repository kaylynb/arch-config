{% if firefox_dpi_scale is defined %}
// Setup DPI
user_pref("layout.css.devPixelsPerPx", "{{ firefox_dpi_scale }}");
{% endif %}

// Fullscreen shouldn't animate. Just no.
user_pref("browser.fullscreen.animate", false);

// Select arc theme (this will get nuked if user.js is updated)
user_pref("general.skins.selectedSkin", "arc-darker-theme");

// Disable 'first run' page on startup
user_pref("browser.startup.homepage_override.mstone","ignore");

user_pref("browser.startup.homepage", "about:blank");
user_pref("browser.newtabpage.enabled", false);

// Don't warn on closing tabs
user_pref("browser.tabs.warnOnClose", false);

// Disable middle mouse from opening pasted text
user_pref("middlemouse.contentLoadURL", false);

// Use multiple process windows
user_pref("dom.ipc.processCount", 7);

user_pref("extensions.pocket.enabled", false);

user_pref("security.webauth.u2f", true);

user_pref("browser.ctrlTab.recentlyUsedOrder", false);


