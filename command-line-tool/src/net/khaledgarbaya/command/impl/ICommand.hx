/**
*@author kgarbaya
**/
package net.khaledgarbaya.command.impl;
interface ICommand
{
  function execute(cmd:String,args:Array<String>):String;  	
}