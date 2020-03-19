# FSN settings to recreate scene where they lock the door with an SGI computer in Jurassic Park

In the movie, Jurassic Park, there is a scene where they must electronically lock a door using an SGI computer running Irix, using a file browser called [FSN](https://en.wikipedia.org/wiki/FSN)

Here's the scene:

[![It's a unix system](https://i.ytimg.com/vi/dxIPcbmo1_U/hqdefault.jpg?sqp=-oaymwEZCNACELwBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCiHI0AaD_D3osW2RlJjL8XaXdYDA)](https://www.youtube.com/watch?v=dxIPcbmo1_U&t=14s)

And here's a recreation from my own O2:


[![It's a unix system](https://i.ytimg.com/vi/Dccx-cLUWIQ/hqdefault.jpg?sqp=-oaymwEZCNACELwBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLBPTs39Zign9E_B-LKNbTYOht8VIA)](https://youtu.be/Dccx-cLUWIQ)

## Setting up the directory and file structure

From any `bash` shell, run `./generate_fsn_jurassic_park_file_structure.sh`.

I know not all Irix machines have `bash` installed. Making this portable should be fairly easy, but I've already spent too much time on this, and need to give it a rest, at least for now.

## Customizing FSN to have similar colors and settings to the movie

The [.Xdefaults](.Xdefaults) settings file can be loaded into `fsn`.

Be aware that colors are repeated multiple times in this file (I think it saves a new copy of everything when you save from the `fsn` settings page).

I also think that the monitor I have hooked up is distorting the colors significantly.
The RGB settings don't match up with what I get when color picking still frames from the film. When I exported a movie made with `mediarecorder`, it looked nothing like it did on-screen.

## Disk usage

To get the folders to appear a certain height, the files generated can be quite large.
This takes up about 867 Megabytes on-disk, but can be deleted and re-created quickly and easily.

## License

MIT

## Contributing

Contributions are welcome. I'd like for this to eventually be portable on systems without `bash` in the future.


