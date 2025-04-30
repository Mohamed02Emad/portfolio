'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "b0c0e0c91d933fc09594520b8ff593be",
"version.json": "009c9e65172e010890f7f65fde438006",
"index.html": "166260f1316a493f64495ae0cd4339d6",
"/": "166260f1316a493f64495ae0cd4339d6",
"main.dart.js": "a2554aed5f83d0c68572925bec84812a",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"me.jpeg": "d5da30b6bb4c0a6db2e937f4ab3aec33",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "8e8a822455d94cd49fd2f653ea94aee7",
"assets/AssetManifest.json": "d5d7438a59cb7aade11c819b25f108d7",
"assets/NOTICES": "8dbe94f0aee3c29e27776766361d4895",
"assets/FontManifest.json": "a8f107a42956c9a52c8fd3ca822d79c8",
"assets/AssetManifest.bin.json": "2590b400a7d2a8ac3376bf0922c51ced",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/squiggly.png": "9894ce549037670d25d2c786036b810b",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/strikethrough.png": "26f6729eee851adb4b598e3470e73983",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/highlight.png": "2fbda47037f7c99871891ca5e57e030b",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/underline.png": "a98ff6a28215341f764f96d627a5d0f5",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/squiggly.png": "68960bf4e16479abb83841e54e1ae6f4",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/strikethrough.png": "72e2d23b4cdd8a9e5e9cadadf0f05a3f",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/highlight.png": "2aecc31aaa39ad43c978f209962a985c",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/underline.png": "59886133294dd6587b0beeac054b2ca3",
"assets/packages/syncfusion_flutter_pdfviewer/assets/fonts/RobotoMono-Regular.ttf": "5b04fdfec4c8c36e8ca574e40b7148bb",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "db46f17ed03439aad28a8dd2aaa8df75",
"assets/fonts/MaterialIcons-Regular.otf": "5322517ae7147ef9afa1fd21e77d5bb0",
"assets/assets/image/svg/whhats.svg": "afd93984c9d2d01ac0e138eff7e038d9",
"assets/assets/image/svg/github.svg": "090284f35e8852769c189092a60bcaa4",
"assets/assets/image/svg/usa.svg": "7dc08795fda1ab42830c20f77d542df8",
"assets/assets/image/svg/code.svg": "d330c6037c078b1b8c6857574d8b8d29",
"assets/assets/image/svg/email.svg": "4d9a1d5a868e994a823bbcaef2d8747e",
"assets/assets/image/svg/linked_in2.svg": "1483ca56d1073b0ad911bae16405a2cb",
"assets/assets/image/svg/outlined_phone.svg": "1775e149cd375638a337c4d3b125b098",
"assets/assets/image/svg/saudi.svg": "93d94d66232583617ff12cea9693ef68",
"assets/assets/image/svg/linked_in.svg": "369d32a66adc75a362347d7e446d4f03",
"assets/assets/image/svg/egypt.svg": "f42f4401fa8457ff9227bcf48dce7146",
"assets/assets/image/svg/email_outlined.svg": "5f3551d977a948462ae265f7f725f2f4",
"assets/assets/image/svg/language.svg": "d604cf4ec913acba137d5348806423b6",
"assets/assets/image/svg/location.svg": "27d786b4551477bba714d26c98aa4db2",
"assets/assets/image/svg/options.svg": "d13d325e24fecc24d9cdaf07d67febf2",
"assets/assets/image/svg/share.svg": "a08dc09c138276df1de4ca13d42dcfb8",
"assets/assets/image/svg/profile_2.svg": "74163e793b9290d7b60b7a2804e55b35",
"assets/assets/image/png/offeru13.jpeg": "24374416f332747d8e1ab573489d7c97",
"assets/assets/image/png/hyn1.jpeg": "78664e54a87640743b70cb466704f7fd",
"assets/assets/image/png/offeru2.jpeg": "8aed8c396210b11a3453d9ee12c27124",
"assets/assets/image/png/wasytk7.jpeg": "bc935f3d8f4dd32cb23559cb9a6dfaa1",
"assets/assets/image/png/wasytk6.jpeg": "e56ce719150b07204c1b4a622c7a5cb1",
"assets/assets/image/png/offeru3.jpeg": "067fa514c1dfa6a2053ca40246ded214",
"assets/assets/image/png/offeru12.jpeg": "f17abee52a413f3ce2ee67ce68c46c75",
"assets/assets/image/png/wasytk1.jpeg": "247bea531197b7f0c458af2b7d1abc49",
"assets/assets/image/png/offeru8.jpeg": "a2769f41f54ef246cc7341543a6eec0c",
"assets/assets/image/png/offeru15.jpeg": "155078fc35f4a82cc07038f8041101e2",
"assets/assets/image/png/hyn7.jpeg": "e0ef325b7af7d904de0377c99e5a1d2b",
"assets/assets/image/png/offeru4.jpeg": "380376c8f0632b9f02048f0f6ac72ff2",
"assets/assets/image/png/offeru5.jpeg": "1b3466be5670a528e124b2ed58abee5e",
"assets/assets/image/png/hyn6.jpeg": "580e167f5ed2a926c8729e2c85298eda",
"assets/assets/image/png/offeru14.jpeg": "68279f70827574937d333e68db78fd0a",
"assets/assets/image/png/offeru9.jpeg": "f6144509807c54063f8168b961c95c29",
"assets/assets/image/png/wasytk3.jpeg": "c9fce30f5b59c1f64657dc94cdfd19df",
"assets/assets/image/png/me.jpeg": "d5da30b6bb4c0a6db2e937f4ab3aec33",
"assets/assets/image/png/offeru6.jpeg": "b4a0735e16c85aa7501aa0013cd623ae",
"assets/assets/image/png/hyn5.jpeg": "35473456cd3c920246186179c7a81fec",
"assets/assets/image/png/hyn4.jpeg": "4c2a5eb233c2fc32bcd7d554be95e97d",
"assets/assets/image/png/offeru7.jpeg": "5a0155c7c3f6ac5a6df45b9f9558b0b1",
"assets/assets/image/png/wasytk2.jpeg": "447b79690a8b58fe20c0da74a7eee053",
"assets/assets/image/png/hyn3.jpeg": "8ddc6cd141cb01631e07c95fca62f6e1",
"assets/assets/image/png/offeru11.jpeg": "47cadf67b4203a74a3ef5464fa540db0",
"assets/assets/image/png/wasytk5.jpeg": "79858ceec961b1e3a2ae47e9706a2578",
"assets/assets/image/png/wasytk4.jpeg": "7e4f1f7dcfd49ed066b7c531b49419f2",
"assets/assets/image/png/offeru10.jpeg": "a73457d01c94b43d529317b90d200ac0",
"assets/assets/image/png/hyn2.jpeg": "b97ccf8eaa6d961231a6373ba3c32f37",
"assets/assets/image/png/offeru1.jpeg": "42a3a2285e713c2b130ec69d6afcd676",
"assets/assets/image/png/wasytk8.jpeg": "080a8ab00b12825e86642cae97df0516",
"assets/assets/files/Mohamed-Emad-Flutter-Developer.pdf": "6fe8692c478d35f55868ba8ef353b4b0",
"assets/assets/fonts/Tajawal-ExtraBold.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/IBM-Medium.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/Tajawal-Light.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/Tajawal-Bold.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/Tajawal-Regular.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/Tajawal-Medium.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/IBMPlexSansArabic-Bold.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/translations/en.json": "aea9d7d0abc95793068b8f6951651b78",
"assets/assets/translations/ar.json": "3d4c75abc0c201bf29f03dd2d1c15d04",
"assets/assets/animations/loading.json": "e999afdd6c506ec0435ecf02b9cbeac2",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
