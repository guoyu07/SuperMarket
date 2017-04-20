package lib;

public class Item{
	private String itemID;
    private String itemName;
    private String cateID;
    private String itemPrice;
    private String itemQty;
    private String location;
    
    public Item(String itemID,String itemName,String cateID,String itemPrice,String itemQty,String location){
    	super();
    	this.itemID=itemID;
    	this.itemName=itemName;
    	this.cateID=cateID;
    	this.itemPrice=itemPrice;
    	this.itemQty=itemQty;
    	this.location=location;
    }
    
    public String getID(){
    	return this.itemID;
    }
    
    public String getName(){
    	return this.itemName;
    }
    
    public String getCate(){
    	return this.cateID;
    }
    
    public String getPrice(){
    	return this.itemPrice;
    }
    
    public String getQty(){
    	return this.itemQty;
    }
    
    public String getLocation(){
    	return this.location;
    }

}
