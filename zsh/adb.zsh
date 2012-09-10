pushScreenshot () {
	adb -s 192.168.1.71:5555 pull /dev/graphics/fb0
	ffmpeg -vframes 1 -vcodec rawvideo -f rawvideo -pix_fmt rgb32 -s 1280x800 -i fb0 -f image2 -vcodec png fb0.png
	scp fb0.png eldritch:$(date '+%s').png
	rm fb0
	rm fb0.png
}
