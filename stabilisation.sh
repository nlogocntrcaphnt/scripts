video_path="$1"

echo $video_path

filename=$(basename -- "$video_path")
extension="${filename##*.}"

ffmpeg -i "$video_path" -vf vidstabdetect -f null -
ffmpeg -i "$video_path" -vf vidstabtransform "$video_path.stab.$extension"
ffmpeg -i "$video_path" -i "$video_path.stab.$extension"  -filter_complex vstack "$video_path.stacked.$extension"
rm transforms.trf
