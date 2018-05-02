Ti.API.info("**** Alloy start");

var Identity = require('ti.identity');

 // Create a keychain item
 var keychainItem = Identity.createKeychainItem({
   identifier: 'mypassword',
   accessGroup: 'group.test.projects'
 });


keychainItem.addEventListener('save', function(e) {
    Ti.API.info("Saved!!! ");
    
    keychainItem.addEventListener('read', function(e) {
    		Ti.API.info("Read!!!");
    		if (e.success) {
    			Ti.API.info(JSON.stringify(e, null, 4));
    		} else {
    			Ti.API.info("Error" + e);
    		}
	});
	
	keychainItem.read();
});

// Write to the keychain
keychainItem.save('s3cr3t_p4$$w0rd');