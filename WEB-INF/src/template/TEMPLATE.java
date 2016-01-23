package template;

import mosaic.MOSAIC;

public class TEMPLATE extends MOSAIC
{
	public
	TEMPLATE(String base_directory)
	{
		super(base_directory, "template");
	}

	//--------------------------------------------------------------------------

	@Override
	public String
	getDisplayName()
	{
		return "Mosaic Template";
	}
}
