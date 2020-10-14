/**
* @author luisfgarciar@gmail.com
* @date 2020
*
* @description Artifact set Class.
*/
public class ArtifactSet {
	@AuraEnabled 
    public String name {get; set;}
    
    @AuraEnabled 
    public Integer with {get; set;}
    
    @AuraEnabled 
    public Integer height {get; set;}
    
    @AuraEnabled 
    public Integer versionsCount {get; set;}
}