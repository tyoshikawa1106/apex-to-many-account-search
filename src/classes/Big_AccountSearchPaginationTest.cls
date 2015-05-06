@isTest
private class Big_AccountSearchPaginationTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());
    
    /**
     * Constructor
     */
    static testMethod void Big_AccountSearchPaginationTest() {

        System.runAs(testAdminUser) {
            
            Test.startTest();
            
            // Test
            Big_AccountSearchPagination result = new Big_AccountSearchPagination();
            
            Test.stopTest();

            // Results
            System.assertEquals(result.activePageNumber, 1);
            System.assertEquals(result.lastPageNumber, 1);
            System.assertEquals(result.isPagesPrevious, false);
            System.assertEquals(result.isPagesNext, false);
        }
    }
}