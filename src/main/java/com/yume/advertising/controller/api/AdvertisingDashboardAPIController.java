package com.yume.advertising.controller.api;

import java.util.List;
import com.yume.advertising.model.Advertisement;
import com.yume.advertising.service.AdvetisingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AdvertisingDashboardAPIController {

	@Autowired
	AdvetisingService advertisingService;

	@RequestMapping(value = "/advertisements", method = RequestMethod.GET)
	public ResponseEntity<List<Advertisement>> listAllAdvertisements() {
		List<Advertisement> advertisements = advertisingService
				.findAllAdvertisement();
		if (advertisements.isEmpty()) {
			return new ResponseEntity<List<Advertisement>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Advertisement>>(advertisements,HttpStatus.OK);
	}

}