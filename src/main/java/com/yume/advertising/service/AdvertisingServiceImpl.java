package com.yume.advertising.service;

import java.util.LinkedList;
import java.util.List;
import org.springframework.stereotype.Service;
import com.yume.advertising.model.Advertisement;
import com.yume.advertising.model.Advertiser;

@Service("userService")
public class AdvertisingServiceImpl implements AdvetisingService {
	
	

	// Right now this is returning static data
	@Override
	public List<Advertisement> findAllAdvertisement() {
			List<Advertisement> listOfAdvertisements = new LinkedList<Advertisement>();
			Advertiser atnt = new Advertiser(1, "AT&T");
			Advertiser macy = new Advertiser(2, "MACY");
			Advertiser historyChannel = new Advertiser(3, "History Channel");
			Advertiser nike = new Advertiser(4, "NIKE");
			Advertiser toyota = new Advertiser(5, "TOYOTA");
		long nowInMs = System.currentTimeMillis();	
		long oneDayInMs = 1000*3600*24;
			listOfAdvertisements.add(new Advertisement(1, "Macy's Q3-Q4 Furniture Sale", macy, 
					(nowInMs - (oneDayInMs *2)), (nowInMs + (oneDayInMs * 3)), 27380, 0.21, 2.62, 0.05));
			listOfAdvertisements.add(new Advertisement(2, "AT&T General Market 2014", atnt, 
					nowInMs - (oneDayInMs * 1), nowInMs + (oneDayInMs * 4), 787380, 0.22, 5.62, 0.01));
			listOfAdvertisements.add(new Advertisement(3, "History Channel Axe Men Tune in", historyChannel, 
					nowInMs - (oneDayInMs * 3), nowInMs + (oneDayInMs * 2), 567380, 0.25, 5.92, 0.02));
			listOfAdvertisements.add(new Advertisement(4, "Nike world cup august", nike, 
					nowInMs - (oneDayInMs * 2), nowInMs + (oneDayInMs * 2), 7380, 0.28, 5.82, 0.04));
			listOfAdvertisements.add(new Advertisement(5, "Toyota Fall giveaway Promo", toyota, 
					nowInMs - (oneDayInMs * 3), nowInMs + (oneDayInMs * 4), 6798440, 0.20, 3.62, 0.06));
			listOfAdvertisements.add(new Advertisement(6, "Toyota Fall sales event", toyota, 
					nowInMs - (oneDayInMs * 2), nowInMs + (oneDayInMs * 1), 90970, 0.25, 4.62, 0.05));
			return listOfAdvertisements;

	}

}
