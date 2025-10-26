# yt-dlp batching script

A little bash script to automate downloading from a list of urls using `yt-dlp`

While `yt-dlp` and associated projects are controversial for potential content piracy and reuploading, I believe these projects are important for the utility they provide archivists and should therefore be supported.

Use the `macos` branch on MacOS for the correct command to generate random filenames.

## Options

- **Auto-Renaming Files**: Due to certain sources causing issues with video titles being too long for operating system paths, the `-r` option may be used (as such: `./downloader.sh -r`) to replace the file names with randomly generated strings, preserving the file extension.

- **Set Output Path**: Set the output path for the files with `-p <path>`.

## Usage

- Install `yt-dlp` and add it to your `PATH` if necessary
- Create a file called `list.txt` which contains a list of urls to be downloaded
- Run `./downloader.sh <options>`