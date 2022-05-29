# flutter_jsonplaceholder

 /// Fix some problem with Web 

flutter run -d chrome --web-renderer html

flutter build web --web-renderer html --release


/// debug mode drift cmd prompt

flutter pub run build_runner build --delete-conflicting-outputs -o web:build/web/
cp -f build/web/worker.dart.js web/worker.dart.js



/// realese mode drift

flutter pub run build_runner build --release --delete-conflicting-outputs -o web:build/web/
cp -f build/web/worker.dart.js web/worker.dart.min.js