//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import flutter_tts
import path_provider_foundation
<<<<<<< HEAD
import speech_to_text_macos
import url_launcher_macos
=======
import speech_to_text
>>>>>>> a01c0ce92f80fa7678f6addeb7cf4e70039b73ad
import video_player_avfoundation

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FlutterTtsPlugin.register(with: registry.registrar(forPlugin: "FlutterTtsPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
<<<<<<< HEAD
  SpeechToTextMacosPlugin.register(with: registry.registrar(forPlugin: "SpeechToTextMacosPlugin"))
  UrlLauncherPlugin.register(with: registry.registrar(forPlugin: "UrlLauncherPlugin"))
=======
  SpeechToTextPlugin.register(with: registry.registrar(forPlugin: "SpeechToTextPlugin"))
>>>>>>> a01c0ce92f80fa7678f6addeb7cf4e70039b73ad
  FVPVideoPlayerPlugin.register(with: registry.registrar(forPlugin: "FVPVideoPlayerPlugin"))
}
