package com.common;

import com.service.CommonService;

public class IDGenerator
{
	public static String getNewProductId()
	{
		CommonService service = new CommonService();
		return service.getNewProductId();
	}
	
	public static String getNewOrderId()
	{
		CommonService service = new CommonService();
		return service.getNewOrderId();
	}
	
	public static String getNewCouponId()
	{
		CommonService service = new CommonService();
		return service.getNewCouponId();
	}
	
	public static String getNewImageId()
	{
		CommonService service = new CommonService();
		return service.getNewImageId();
	}
	
	public static String getNewCartId()
	{
		CommonService service = new CommonService();
		return service.getNewCartId();
	}
	
	public static String getNewBoardContentId()
	{
		CommonService service = new CommonService();
		return service.getNewBoardContentId();
	}
	
	public static String getNewBoardFileId()
	{
		CommonService service = new CommonService();
		return service.getNewBoardFileId();
	}
	
	public static String getNewBoardReplyId()
	{
		CommonService service = new CommonService();
		return service.getNewBoardReplyId();
	}
}
