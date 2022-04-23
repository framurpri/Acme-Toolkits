/*
 * AuthenticatedProviderController.java
 *
 * Copyright (C) 2012-2022 Rafael Corchuelo.
 *
 * In keeping with the traditional purpose of furthering education and research, it is
 * the policy of the copyright owner to permit non-commercial use and redistribution of
 * this software. It has been tested carefully, but it is not guaranteed for any particular
 * purposes. The copyright owner does not offer any warranties or representations, nor do
 * they accept any liabilities with respect to them.
 */

package acme.features.inventor.item;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import acme.entities.item.Item;
import acme.framework.controllers.AbstractController;
import acme.roles.Inventor;

@Controller
public class InventorItemController extends AbstractController<Inventor, Item> {

	// Internal state ---------------------------------------------------------

	@Autowired
	protected InventorItemListOwnComponentsService	listOwnComponentsService;

	@Autowired
	protected InventorItemShowService	showService;
	
	@Autowired
	protected InventorItemListComponentToolkitService listComponentToolkitService;
	
	@Autowired
	protected InventorItemListToolToolkitService listToolToolkitService;

	// Constructors -----------------------------------------------------------


	@PostConstruct
	protected void initialise() {
		super.addCommand("list-own-components", "list" ,this.listOwnComponentsService);
		super.addCommand("show", this.showService);
		super.addCommand("list-components-toolkits", "list", this.listComponentToolkitService);
		super.addCommand("list-tools-toolkits", "list", this.listToolToolkitService);
	}

}
