/**
*@author kgarbaya
**/
import net.khaledgarbaya.processor.CmdProcessor;
import net.khaledgarbaya.helper.LogHelper;
class CommandLineTool
{
	/// parse commands and perform action
    private var processor:CmdProcessor;

    /// this is how haxe will know that this is the main class
    public static function main() : Void
    {
        var interpreter = new CommandLineTool();
        interpreter.run();
    }
	public function new()
	{
        processor = new CmdProcessor();
	}
	public function run():Void
	{
	    var command = getCommandFromSysArgs();
	    try
        {
            var ret = processor.process(command,Sys.args());
            if( ret != null )
                LogHelper.println(ret+"\n");
        }
        catch (ex:CmdError)
        {
            LogHelper.error("Unknown Command");
        }
	}

	public function getCommandFromSysArgs() : String
	{
        for(arg in Sys.args())
        {
            if(arg.charAt(0) == "-")
            {
            	/// here you handle command config like -arg
            }
            else
            {
                return arg;
            }
        }

        return "help";
	}
}