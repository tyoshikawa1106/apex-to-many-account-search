@isTest
private class Big_AccountSearchDaoTest {

    private static Big_AccountSearchDao dao = new Big_AccountSearchDao();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * Get Account Count
     */
    static testMethod void getAccountCountTest1() {

        System.runAs(testAdminUser) {

            Account account = new Account();
            
            Test.startTest();
            
            Integer result = dao.getAccountCount(account);
            
            Test.stopTest();

            // Results
            System.assertEquals(result, 0);
        }
    }

    /**
     * Get Account Count
     */
    static testMethod void getAccountCountTest2() {

        System.runAs(testAdminUser) {

            Account account = new Account(
                 Name = 'Sample'
                ,AccountNumber = 'A-0001'
            );
            insert account;
            
            Test.startTest();
            
            Integer result = dao.getAccountCount(account);
            
            Test.stopTest();

            // Results
            System.assertEquals(result, 1);
        }
    }

    /**
     * Get Accounts
     */
    static testMethod void getAccountsTest1() {

        System.runAs(testAdminUser) {

            Account account = new Account();
            
            Test.startTest();
            
            ApexPages.StandardSetcontroller results = dao.getAccounts(account);
            
            Test.stopTest();

            // Results
            List<Account> resultAccounts = (List<Account>)results.getRecords();
            System.assertEquals(resultAccounts.isEmpty(), true);
        }
    }

    /**
     * Get Accounts
     */
    static testMethod void getAccountsTest2() {

        System.runAs(testAdminUser) {

            Account account = new Account(
                 Name = 'Sample'
                ,AccountNumber = 'A-0001'
            );
            insert account;
            
            Test.startTest();
            
            ApexPages.StandardSetcontroller results = dao.getAccounts(account);
            
            Test.stopTest();

            // Results
            List<Account> resultAccounts = (List<Account>)results.getRecords();
            System.assertEquals(resultAccounts.size(), 1);
        }
    }
}