'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "df8e9b0d68599302b43f4007ca04cec3",
"version.json": "98ea86d308033c163908d65fafb30d7d",
"splash/img/light-2x.png": "cbef1bd0e37522aa38db978d4701ebc2",
"splash/img/dark-4x.png": "46090b3972cf025a4b1d4049b30b80a2",
"splash/img/light-3x.png": "c8de27933a04d63c25c7b3daa7b0f025",
"splash/img/dark-3x.png": "c8de27933a04d63c25c7b3daa7b0f025",
"splash/img/light-4x.png": "46090b3972cf025a4b1d4049b30b80a2",
"splash/img/dark-2x.png": "cbef1bd0e37522aa38db978d4701ebc2",
"splash/img/dark-1x.png": "4ef0ebd2347116c067bb47bf95f2cd85",
"splash/img/light-1x.png": "4ef0ebd2347116c067bb47bf95f2cd85",
"index.html": "302604ee844de9f84d6e6de2d809daae",
"/": "302604ee844de9f84d6e6de2d809daae",
"main.dart.js": "7a98538585876aa2d8b40abda76259dc",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"assets/AssetManifest.json": "e04d735458b5f467eeb27faf03bb3cae",
"assets/NOTICES": "f68051b14b445a1912f9091b1f7d71ff",
"assets/FontManifest.json": "54de83100003e1a6bcf54ffaa122557d",
"assets/AssetManifest.bin.json": "8957213c2d6cb598bd7ca6b057c86d0a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "dded390c405efc8a371ed84c24c05e9e",
"assets/fonts/MaterialIcons-Regular.otf": "08cc65899587ddc7e9b517a4fd41da21",
"assets/assets/image/svg/github.svg": "84818c18816ba2cb7e1be14d2f691789",
"assets/assets/image/svg/usa.svg": "7dc08795fda1ab42830c20f77d542df8",
"assets/assets/image/svg/code.svg": "9b1d227d283f96dc0980891c3bb92b82",
"assets/assets/image/svg/outlined_phone.svg": "1775e149cd375638a337c4d3b125b098",
"assets/assets/image/svg/saudi.svg": "93d94d66232583617ff12cea9693ef68",
"assets/assets/image/svg/linked_in.svg": "05a86a0c4dfa89a3370294d478045963",
"assets/assets/image/svg/egypt.svg": "f42f4401fa8457ff9227bcf48dce7146",
"assets/assets/image/svg/email_outlined.svg": "5f3551d977a948462ae265f7f725f2f4",
"assets/assets/image/svg/language.svg": "d604cf4ec913acba137d5348806423b6",
"assets/assets/image/svg/location.svg": "27d786b4551477bba714d26c98aa4db2",
"assets/assets/image/svg/options.svg": "d13d325e24fecc24d9cdaf07d67febf2",
"assets/assets/image/svg/share.svg": "a08dc09c138276df1de4ca13d42dcfb8",
"assets/assets/image/svg/profile_2.svg": "74163e793b9290d7b60b7a2804e55b35",
"assets/assets/image/png/me.jpeg": "d5da30b6bb4c0a6db2e937f4ab3aec33",
"assets/assets/fonts/Tajawal-ExtraBold.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/IBM-Medium.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/Tajawal-Light.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/Tajawal-Bold.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/Tajawal-Regular.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/Tajawal-Medium.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/IBMPlexSansArabic-Bold.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/translations/en.json": "87afe4d28eedb06366e4bcb3687a84d9",
"assets/assets/translations/ar.json": "2bb72d5a2b5fb90d6c733f5f7cc8415f",
"assets/assets/animations/loading.json": "e999afdd6c506ec0435ecf02b9cbeac2",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
