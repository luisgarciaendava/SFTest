({  
    loadArtifacts : function(component, event, helper) {  
      var factoryId = component.get("v.recordId");
        var action = component.get("c.getArtifacts");
        action.setParams({ "factoryId" : factoryId});
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                var records = response.getReturnValue();
                component.set("v.artifactsList", records);                
            } 
        });
        $A.enqueueAction(action); 
    }  
})