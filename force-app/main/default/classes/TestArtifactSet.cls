@isTest
public class TestArtifactSet {
    
    static final String NAME='ATX-001';
    static final Integer WITH=23;
    static final Integer HEIGHT=40;
    static final Integer COUNT=5;
    
    @isTest static void testDefaultConstructor() {        
        
        // Perform test
        Test.startTest();
        
        ArtifactSet artifact = new ArtifactSet();
        artifact.name=NAME;
        artifact.with=WITH;
        artifact.height=HEIGHT;
        artifact.versionsCount=COUNT;
        
        Test.stopTest();
        
        // Verify
        system.assertEquals(NAME, artifact.name);
        system.assertEquals(WITH, artifact.with);
        system.assertEquals(HEIGHT, artifact.height);
        system.assertEquals(COUNT, artifact.versionsCount);
    }
}