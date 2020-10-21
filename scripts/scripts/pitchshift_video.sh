#!/usr/bin/env sh

video_in="$1"
video_out="$2"
pitch="$3" # like -2400 for 2 octaves lower

tmp_audio_original_pitch="$(mktemp --suffix=.wav)"
tmp_audio_shifted_pitch="$(mktemp --suffix=.wav)"

echo extracting audio from "$video_in" ...
ffmpeg -loglevel panic -stats -y -i "$video_in" "$tmp_audio_original_pitch"

echo pitch shifting by $pitch cents...
sox "$tmp_audio_original_pitch" "$tmp_audio_shifted_pitch" pitch "$pitch" 20

echo replacing audio...
# somehow pitch shifting makes audio a bit earler so here v we delay it so it's about right
ffmpeg -loglevel panic -stats -i "$video_in" -itsoffset 0.185 -i "$tmp_audio_shifted_pitch"  -c:v copy -map 0:v:0 -map 1:a:0 "$video_out" && echo done! video with shifted audio saved to "$video_out".

echo deleting temporary files...
rm "$tmp_audio_original_pitch"
rm "$tmp_audio_shifted_pitch"
