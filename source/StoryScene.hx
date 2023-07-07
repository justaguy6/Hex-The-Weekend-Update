import flixel.FlxG;
import flixel.FlxSprite;

class StoryScene extends MusicBeatState
{
	#if windows 
	public var handler:MP4Handler;
        #end
	public var path:String = "";

	public function new(bruh)
	{
		path = bruh;
		super();
	}

	public override function load()
	{
		#if windows 
		handler = new MP4Handler();
		#end
	}

	public override function update(elapsed)
	{
		if (FlxG.keys.justPressed.ESCAPE)
		{
			#if windows 
			handler.kill();
			#end
			switchState(new BruhADiagWindow(PlayState.SONG.songId));
		}
		super.update(elapsed);
	}

	public override function create()
	{
	        #if windows 
		handler.playMP4(Paths.video(path));
		handler.finishCallback = function()
		{
			switchState(new BruhADiagWindow(PlayState.SONG.songId));
		};
		#end
		super.create();
	}
}
