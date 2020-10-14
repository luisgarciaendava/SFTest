@isTest
public class TestArtifactController {
    
    static final String FACTORY_NAME='Factory ABC';
    static final String ARTIFACT_NAME='Artifact XYZ';
    static final Integer ARTIFACT_WITH=10;
    static final Integer ARTIFACT_HEIGHT=22;
    static final Integer NUMBER_OF_VERSIONS=3;
    
    @testSetup static void setup() {
        // Create Factory
        Artifact_Factory__c factory = new Artifact_Factory__c(Name = FACTORY_NAME);
        insert factory;  
        
        // Create Artifact
        Artifact__c artifact = new Artifact__c(Name = ARTIFACT_NAME, With__c=ARTIFACT_WITH, 
                                               Height__c=ARTIFACT_HEIGHT, Artifact_Factory__c=factory.Id );
        insert artifact;
        
        // Create Versions
        List<Artifact_Version__c> versionList = new List<Artifact_Version__c>();
        
        for(Integer i=1;i<=NUMBER_OF_VERSIONS;i++) {
            versionList.add(new Artifact_Version__c(Artifact__c=artifact.Id, Version__c=i));
        }
        insert versionList;
        
    }
    
    @isTest static void testGetArtifacts() {
        // Retrive the Factory.
        Artifact_Factory__c factory = [SELECT Id FROM Artifact_Factory__c WHERE Name = :FACTORY_NAME LIMIT 1];
        
        // Perform test
        Test.startTest();
        List<ArtifactSet> resultList = ArtifactController.getArtifacts(factory.Id);
        Test.stopTest();
        
        ArtifactSet result = resultList.get(0);
        
        // Verify 
        system.assertEquals( 1, resultList.size());
        system.assertEquals( ARTIFACT_NAME, result.name);
        system.assertEquals( ARTIFACT_WITH, result.with);
        system.assertEquals( ARTIFACT_HEIGHT, result.height);
        system.assertEquals( NUMBER_OF_VERSIONS, result.versionsCount);
    }
}