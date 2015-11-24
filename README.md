# Converting .MOD Files .mp4

I have a TON of old diving footage, and much of it is formatted as .MOD files. Below are the
steps that I followed to convert them to .mp4.

# Dependencies
* Homebrew
* ffmpeg (installed via brew)
* rename (optional, installed via brew)

# Steps
* Ensure that no files/directories have space in the name: `find . -depth -name "* *" -execdir rename 's/ /_/g' "{}" \;`
* Ensure the conversion script has the right privileges: `chmod +x convert_videos.sh`
* Run the script from the root of the directory with the videos to change: `./convert_videos.sh`

# Notes
* Mileage may vary, ffmpeg command is a bit tricky. If it encounters an existing version, it should prompt for overwrite.
* I was too lazy to support removal of both .MOD and .mod extensions, so it's possible to end up with annoying files like 105.MOD.mp4
* Cleanup of the old files is simple, but be careful! `find . -iname '*.mod' -delete`
