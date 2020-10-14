/**
* @author luisfgarciar@gmail.com
* @date 2020
*
* @description Class to handle the Artifacts.
*/
public class ArtifactController {
    
    /**
    * @description Get the artifacts by factory ID.
    * returns a List of Artifacts.
    */
    @AuraEnabled
    Public static List<ArtifactSet> getArtifacts(string factoryId){ 
        List<ArtifactSet> resultList = new List<ArtifactSet>();
        
        List<Artifact__c> artifactList = [SELECT ID, NAME, Height__c, With__c, 
                                          (SELECT Version__c FROM Artifact_Versions__r) 
                                          FROM Artifact__c 
                                          WHERE Artifact_Factory__c = :factoryId];
        
        if(artifactList.size() >0) {
            for (Artifact__c artifact: artifactList) {
                ArtifactSet artifactResul = new ArtifactSet();
                artifactResul.name  =   artifact.Name;
                artifactResul.with  =   Integer.valueOf(artifact.With__c);
                artifactResul.height  =   Integer.valueOf(artifact.Height__c);
                artifactResul.versionsCount  =   artifact.Artifact_Versions__r.size();
                resultList.add(artifactResul);
            }
        }
        
        return resultList;
    }
}