package com.yume.advertising.model;



public class Advertisement {
	
	private long id;
	private String name;
	private Advertiser advertiser;
	private long startDate;
	private long endDate;
	private int impressions;
	private double vcr;
	private double cpm;
	private double cpr;
	
	
	
	
public Advertisement(long id, String name, Advertiser advertiser,
			long startDate, long endDate, int impressions, double vcr,
			double cpm, double cpr) {
		super();
		this.id = id;
		this.name = name;
		this.advertiser = advertiser;
		this.startDate = startDate;
		this.endDate = endDate;
		this.impressions = impressions;
		this.vcr = vcr;
		this.cpm = cpm;
		this.cpr = cpr;
		
		
	}

	public double getStartingPoint(){
		return ((startDate - System.currentTimeMillis() + 259200000)/ 6048000);
	}
	
	public double getTotalBarLength() {
		return ((endDate - startDate) /(6048000));
	}
	
	public void setStartDate(long startDate) {
		this.startDate = startDate;
	}
	public void setEndDate(long endDate) {
		this.endDate = endDate;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Advertiser getAdvertiser() {
		return advertiser;
	}
	public void setAdvertiser(Advertiser advertiser) {
		this.advertiser = advertiser;
	}
	
	public double getGoal(){
		long now = System.currentTimeMillis();
		long goalCompleted =  now - startDate;
		long totalGoal = endDate - startDate;
		double goalpercent = (goalCompleted*100)/  totalGoal;
		return goalpercent;
	}

	public int getImpressions() {
		return impressions;
	}
	public void setImpressions(int impressions) {
		this.impressions = impressions;
	}
	public double getVcr() {
		return vcr;
	}
	public void setVcr(double vcr) {
		this.vcr = vcr;
	}
	public double getCpm() {
		return cpm;
	}
	public void setCpm(double cpm) {
		this.cpm = cpm;
	}
	public double getCpr() {
		return cpr;
	}
	public void setCpr(double cpr) {
		this.cpr = cpr;
	}



	public long getStartDate() {
		return startDate;
	}



	public long getEndDate() {
		return endDate;
	}
	
}
