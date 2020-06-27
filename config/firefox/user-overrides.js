/*** MY OVERRIDES ***/
//user_pref("browser.startup.page", 1); // 0102
//user_pref("browser.startup.homepage", "https://duckduckgo.com"); // 0103
//user_pref("browser.sessionstore.max_tabs_undo", 0); // 1020
//user_pref("security.mixed_content.block_display_content", false); // 1241
//user_pref("media.gmp-widevinecdm.visible", true); // 1825
//user_pref("media.gmp-widevinecdm.enabled", true); // 1825
//user_pref("media.peerconnection.enabled", true); // 2001
//user_pref("privacy.clearOnShutdown.sessions", false); // 2803
//user_pref("dom.enable_resource_timing", true); // 4602
//user_pref("dom.enable_performance", true); // 4603
//user_pref("browser.zoom.siteSpecific", true); // 4605
//user_pref("media.webspeech.synth.enabled", true); // 4608
//user_pref("media.video_stats.enabled", true); // 4610
//user_pref("media.ondevicechange.enabled", true); // 4612
//user_pref("webgl.enable-debug-renderer-info", true); // 4613
//user_pref("dom.w3c_pointer_events.enabled", true); // 4614
//user_pref("ui.use_standins_for_native_colors", false); // 4615
//use_pref("beacon.enabled", true);
*/

user_pref("_user.js.parrot", "overrides section syntax error");
user_pref("general.autoScroll", true);

user_pref("keyword.enabled", true); // 0801
user_pref("browser.startup.page", 3);
user_pref("browser.search.suggest.enabled", true); // 0807
user_pref("browser.urlbar.suggest.searches", true); // 0807
user_pref("browser.urlbar.clickSelectsAll", true);
user_pref("browser.urlbar.doubleClickSelectsAll", false);
user_pref("browser.cache.disk.enable", true); //1001
user_pref("browser.messaging-system.whatsNewPanel.enabled", false); // What's New [FF69+]

user_pref("signon.rememberSignons", false); // 0901

user_pref("dom.targetBlankNoOpener.enabled", false);
user_pref("dom.webgpu.enabled", true);

user_pref("privacy.clearOnShutdown.cookies", false);
user_pref("privacy.clearOnShutdown.history", false); // Browsing & Download History
user_pref("privacy.resistFingerprinting.letterboxing", false); // 4504

user_pref("webgl.disabled", false); // 2010
user_pref("webgl.enable-webgl2", true); // 2010

user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("ui.systemUsesDarkTheme", 1); // [HIDDEN PREF]
user_pref("layers.acceleration.force-enabled", false);

user_pref("gfx.webrender.all", true);
user_pref("gfx.webrender.compositor", true);
user_pref("gfx.webrender.enabled", true);

user_pref("extensions.webextensions.restrictedDomains", ""); //2662
user_pref("extensions.pocket.enabled", false); // Pocket Account [FF46+]

user_pref("_user.js.parrot", "SUCCESS");
