@isTest
private class Big_AccountSearchControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * Constructor
     */
    static testMethod void Big_AccountSearchControllerTest1() {

        System.runAs(testAdminUser) {

            Account account = new Account();
            
            Test.startTest();
            
            Big_AccountSearchController cls = new Big_AccountSearchController(new ApexPages.StandardController(account));
            // Get Accounts
            List<Account> resultAccounts = cls.getAccounts();
            
            Test.stopTest();

            // Results
            System.assertEquals(cls.recordCount, 0);
            System.assertEquals(resultAccounts.isEmpty(), true);
        }
    }

    /**
     * Constructor
     */
    static testMethod void Big_AccountSearchControllerTest2() {

        System.runAs(testAdminUser) {

            Account account = new Account(
                 Name = 'Sample'
                ,AccountNumber = 'A-0001'
            );
            insert account;
            
            Test.startTest();
            
            Big_AccountSearchController cls = new Big_AccountSearchController(new ApexPages.StandardController(account));
            // Get Accounts
            List<Account> resultAccounts = cls.getAccounts();
            
            Test.stopTest();

            // Results
            System.assertEquals(cls.recordCount, 1);
            System.assertEquals(resultAccounts.size(), 1);
        }
    }

    /**
     * Constructor
     */
    static testMethod void Big_AccountSearchControllerTest3() {

        System.runAs(testAdminUser) {

            List<Account> accounts = new List<Account>();
            for (Integer i = 0; i < 200; i++) {
                accounts.add(new Account(Name = 'Sample'));
            }
            insert accounts;

            Account account = new Account();
            
            Test.startTest();
            
            Big_AccountSearchController cls = new Big_AccountSearchController(new ApexPages.StandardController(account));
            // Get Accounts
            List<Account> resultAccounts = cls.getAccounts();
            
            Test.stopTest();

            // Results
            System.assertEquals(cls.recordCount, 200);
            System.assertEquals(resultAccounts.size(), 5);
        }
    }

    /**
     * pagesNext
     */
    static testMethod void pagesNextTest1() {

        System.runAs(testAdminUser) {

            List<Account> accounts = new List<Account>();
            for (Integer i = 0; i < 200; i++) {
                accounts.add(new Account(Name = 'Sample'));
            }
            insert accounts;

            Account account = new Account();
            
            Test.startTest();
            
            Big_AccountSearchController cls = new Big_AccountSearchController(new ApexPages.StandardController(account));
            // pagesNext
            cls.pagesNext();
            // Get Accounts
            List<Account> resultAccounts = cls.getAccounts();
            
            Test.stopTest();

            // Results
            System.assertEquals(cls.recordCount, 200);
            System.assertEquals(resultAccounts.size(), 5);
        }
    }

    /**
     * pagesPrevious
     */
    static testMethod void pagesPreviousTest1() {

        System.runAs(testAdminUser) {

            List<Account> accounts = new List<Account>();
            for (Integer i = 0; i < 200; i++) {
                accounts.add(new Account(Name = 'Sample'));
            }
            insert accounts;

            Account account = new Account();
            
            Test.startTest();
            
            Big_AccountSearchController cls = new Big_AccountSearchController(new ApexPages.StandardController(account));
            // pagesNext
            cls.pagesNext();
            // pagesPrevious
            cls.pagesPrevious();
            // Get Accounts
            List<Account> resultAccounts = cls.getAccounts();
            
            Test.stopTest();

            // Results
            System.assertEquals(cls.recordCount, 200);
            System.assertEquals(resultAccounts.size(), 5);
        }
    }

    /**
     * pagesLast
     */
    static testMethod void pagesLastTest1() {

        System.runAs(testAdminUser) {

            List<Account> accounts = new List<Account>();
            for (Integer i = 0; i < 200; i++) {
                accounts.add(new Account(Name = 'Sample'));
            }
            insert accounts;

            Account account = new Account();
            
            Test.startTest();
            
            Big_AccountSearchController cls = new Big_AccountSearchController(new ApexPages.StandardController(account));
            // pagesLast
            cls.pagesLast();
            // Get Accounts
            List<Account> resultAccounts = cls.getAccounts();
            
            Test.stopTest();

            // Results
            System.assertEquals(cls.recordCount, 200);
            System.assertEquals(resultAccounts.size(), 5);
        }
    }

    /**
     * pagesFirst
     */
    static testMethod void pagesFirstTest1() {

        System.runAs(testAdminUser) {

            List<Account> accounts = new List<Account>();
            for (Integer i = 0; i < 200; i++) {
                accounts.add(new Account(Name = 'Sample'));
            }
            insert accounts;

            Account account = new Account();
            
            Test.startTest();
            
            Big_AccountSearchController cls = new Big_AccountSearchController(new ApexPages.StandardController(account));
            // pagesLast
            cls.pagesLast();
            // pagesFirst
            cls.pagesFirst();
            // Get Accounts
            List<Account> resultAccounts = cls.getAccounts();
            
            Test.stopTest();

            // Results
            System.assertEquals(cls.recordCount, 200);
            System.assertEquals(resultAccounts.size(), 5);
        }
    }
}