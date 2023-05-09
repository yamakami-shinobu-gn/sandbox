#!/bin/bash

# 背景用（不透明）・意匠用（背景透明）の２つのPNGファイルからアプリ用アイコン一式を生成します
# ImageMagickを使用します
# 画像はそれぞれ 1536 ピクセル四方である必要があります

if [ $# -ne 3 ];then
    echo "Usage: $0 <background png> <foreground png> <out path>";
    echo "  <background png> and <foreground png> needed size [1536x1536]";
    exit 1
fi

mkdir -p "$3/app_icons/Android/GooglePlay"
mkdir -p "$3/app_icons/Android/drawable-mdpi"
mkdir -p "$3/app_icons/Android/drawable-hdpi"
mkdir -p "$3/app_icons/Android/drawable-xhdpi"
mkdir -p "$3/app_icons/Android/drawable-xxhdpi"
mkdir -p "$3/app_icons/Android/drawable-xxxhdpi"
mkdir -p "$3/app_icons/iOS"

convert $1 $2 -gravity center -crop 1024x1024+0+0 -composite -resize 48x48 -sharpen 0.75x0.5 "$3/app_icons/Android/drawable-mdpi/icon.png"
convert $2 -gravity center -resize 108x108 "$3/app_icons/Android/drawable-mdpi/icon_foreground.png"
convert $1 -gravity center -resize 108x108 "$3/app_icons/Android/drawable-mdpi/icon_background.png"

convert $1 $2 -gravity center -crop 1024x1024+0+0 -composite -resize 72x72 "$3/app_icons/Android/drawable-hdpi/icon.png"
convert $2 -gravity center -resize 162x162 "$3/app_icons/Android/drawable-hdpi/icon_foreground.png"
convert $1 -gravity center -resize 162x162 "$3/app_icons/Android/drawable-hdpi/icon_background.png"

convert $1 $2 -gravity center -crop 1024x1024+0+0 -composite  -resize 96x96 "$3/app_icons/Android/drawable-xhdpi/icon.png"
convert $2 -gravity center -resize 216x216 "$3/app_icons/Android/drawable-xhdpi/icon_foreground.png"
convert $1 -gravity center -resize 216x216 "$3/app_icons/Android/drawable-xhdpi/icon_background.png"

convert $1 $2 -gravity center -crop 1024x1024+0+0 -composite  -resize 144x144 "$3/app_icons/Android/drawable-xxhdpi/icon.png"
convert $2 -gravity center -resize 324x324 "$3/app_icons/Android/drawable-xxhdpi/icon_foreground.png"
convert $1 -gravity center -resize 324x324 "$3/app_icons/Android/drawable-xxhdpi/icon_background.png"

convert $1 $2 -gravity center -crop 1024x1024+0+0 -composite  -resize 192x192 "$3/app_icons/Android/drawable-xxxhdpi/icon.png"
convert $2 -gravity center -resize 432x432 "$3/app_icons/Android/drawable-xxxhdpi/icon_foreground.png"
convert $1 -gravity center -resize 432x432 "$3/app_icons/Android/drawable-xxxhdpi/icon_background.png"

convert $1 $2 -gravity center -crop 1024x1024+0+0 -composite -resize 512x512 "$3/app_icons/Android/GooglePlay/artwork.png"
convert $1 $2 -gravity center -crop 1024x1024+0+0 -composite -alpha Off "$3/app_icons/iOS/Icon.png"
