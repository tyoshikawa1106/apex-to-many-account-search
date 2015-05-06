public with sharing class Big_AccountSearchDao {
    
    /**
     * Constructor
     */
    public Big_AccountSearchDao() {
        
    }

    /**
     * Get Account Count
     */
    public Integer getAccountCount(Account account) {
        String query = '';
        query += ' SELECT ';
        query += ' COUNT() ';
        query += ' FROM ';
        query += ' Account ';

        // Get Where Query
        query += getWhereQuery(account);

        query += ' LIMIT 10000000 ';
        return database.countQuery(query);
    }
    
    /**
     * Get Accounts
     */
    public ApexPages.StandardSetcontroller getAccounts(Account account) {
        String query = '';
        query += ' SELECT ';
        query += ' Id ';
        query += ' ,Name ';
        query += ' ,AccountNumber ';
        query += ' ,Industry ';
        query += ' ,Type ';
        query += ' FROM ';
        query += ' Account ';

        // Get Where Query
        query += getWhereQuery(account);

        query += ' ORDER BY Name ASC ';
        query += ' LIMIT 10000 ';
        return new ApexPages.StandardSetController(Database.getQueryLocator(query));
    }

    /**
     * Get Where Query
     */
    private String getWhereQuery(Account account) {
        String query = '';
        String joinQuery = ' WHERE ';
        if (String.isNotEmpty(account.Name)) {
            query += joinQuery + ' Name LIKE ' + '\'' + String.escapeSingleQuotes(account.Name + '%') + '\'';
            joinQuery = ' AND ';
        }

        if (String.isNotEmpty(account.AccountNumber)) {
            query += joinQuery + ' AccountNumber = ' + '\'' + String.escapeSingleQuotes(account.AccountNumber) + '\'';
            joinQuery = ' AND ';
        }

        return query;
    }
}