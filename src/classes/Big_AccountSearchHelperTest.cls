@isTest
private class Big_AccountSearchHelperTest {

    private static Big_AccountSearchHelper helper = new Big_AccountSearchHelper();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());
    private static final Integer MAX_VIEW_SIZE = 5;

    /**
     * Get Last Page
     */
    static testMethod void getLastPageNumberTest1() {

        System.runAs(testAdminUser) {

            Integer resultSize = null;
            Integer pageSize = null;
            
            Test.startTest();
            
            // Test getLastPageNumber
            Integer result = helper.getLastPageNumber(resultSize, pageSize);
            
            Test.stopTest();

            // Results
            System.assertEquals(result, null);
        }
    }
    
    /**
     * Get Last Page
     */
    static testMethod void getLastPageNumberTest2() {

        System.runAs(testAdminUser) {

            Integer resultSize = 0;
            Integer pageSize = null;
            
            Test.startTest();
            
            // Test getLastPageNumber
            Integer result = helper.getLastPageNumber(resultSize, pageSize);
            
            Test.stopTest();

            // Results
            System.assertEquals(result, null);
        }
    }
    
    /**
     * Get Last Page
     */
    static testMethod void getLastPageNumberTest3() {

        System.runAs(testAdminUser) {

            Integer resultSize = null;
            Integer pageSize = 0;
            
            Test.startTest();
            
            // Test getLastPageNumber
            Integer result = helper.getLastPageNumber(resultSize, pageSize);
            
            Test.stopTest();

            // Results
            System.assertEquals(result, null);
        }
    }
    
    /**
     * Get Last Page
     */
    static testMethod void getLastPageNumberTest4() {

        System.runAs(testAdminUser) {

            Integer resultSize = 0;
            Integer pageSize = 0;
            
            Test.startTest();
            
            // Test getLastPageNumber
            Integer result = helper.getLastPageNumber(resultSize, pageSize);
            
            Test.stopTest();

            // Results
            System.assertEquals(result, 0);
        }
    }
    
    /**
     * Get Last Page
     */
    static testMethod void getLastPageNumberTest5() {

        System.runAs(testAdminUser) {

            Integer resultSize = 1;
            Integer pageSize = 1;
            
            Test.startTest();
            
            // Test getLastPageNumber
            Integer result = helper.getLastPageNumber(resultSize, pageSize);
            
            Test.stopTest();

            // Results
            System.assertEquals(result, 1);
        }
    }
    
    /**
     * Get Last Page
     */
    static testMethod void getLastPageNumberTest6() {

        System.runAs(testAdminUser) {

            Integer resultSize = 1;
            Integer pageSize = 2;
            
            Test.startTest();
            
            // Test getLastPageNumber
            Integer result = helper.getLastPageNumber(resultSize, pageSize);
            
            Test.stopTest();

            // Results
            System.assertEquals(result, 1);
        }
    }
    
    /**
     * Get Last Page
     */
    static testMethod void getLastPageNumberTest7() {

        System.runAs(testAdminUser) {

            Integer resultSize = 2;
            Integer pageSize = 1;
            
            Test.startTest();
            
            // Test getLastPageNumber
            Integer result = helper.getLastPageNumber(resultSize, pageSize);
            
            Test.stopTest();

            // Results
            System.assertEquals(result, 2);
        }
    }
    
    /**
     * Get Last Page
     */
    static testMethod void getLastPageNumberTest8() {

        System.runAs(testAdminUser) {

            Integer resultSize = 1000;
            Integer pageSize = 5;
            
            Test.startTest();
            
            // Test getLastPageNumber
            Integer result = helper.getLastPageNumber(resultSize, pageSize);
            
            Test.stopTest();

            // Results
            System.assertEquals(result, 200);
        }
    }
    
    /**
     * Get Last Page
     */
    static testMethod void getLastPageNumberTest9() {

        System.runAs(testAdminUser) {

            Integer resultSize = 3;
            Integer pageSize = 2;
            
            Test.startTest();
            
            // Test getLastPageNumber
            Integer result = helper.getLastPageNumber(resultSize, pageSize);
            
            Test.stopTest();

            // Results
            System.assertEquals(result, 2);
        }
    }
}