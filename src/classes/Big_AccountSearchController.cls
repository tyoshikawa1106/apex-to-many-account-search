public with sharing class Big_AccountSearchController {

    private static final Integer MAX_VIEW_SIZE = 5;
    private Big_AccountSearchHelper helper = new Big_AccountSearchHelper();
    private Big_AccountSearchDao dao = new Big_AccountSearchDao();
    public Integer recordCount {get; set;}
    public Account account {get; set;}
    public ApexPages.StandardSetcontroller tableResult {get;set;}
    public Big_AccountSearchPagination pagination {get; set;}
    
    /**
     * Constructor
     */
    public Big_AccountSearchController(ApexPages.StandardController stdController) {
        this.recordCount = 0;
        this.account = new Account();
        this.pagination = new Big_AccountSearchPagination();
        doSearch();
    }
    
    /**
     * Account Search
     */
    public void doSearch() {
        this.recordCount = this.dao.getAccountCount(this.account);
        this.tableResult = this.dao.getAccounts(this.account);
        this.tableResult.setPageSize(MAX_VIEW_SIZE);
        setPaginationInfo();
    }

    /**
     * Get Account
     */
    public List<Account> getAccounts() {
        return (List<Account>)this.tableResult.getRecords();
    }

    /**
     * Page Next
     */
    public void pagesNext() {
        try {
            // Page Next
            this.tableResult.next();
            // Set Pagination
            setPaginationInfo();
        } catch(Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,e.getMessage()));
            return;
        }
    }

    /**
     * Page Previous
     */
    public void pagesPrevious() {
        try {
            // Page Previous
            this.tableResult.previous();
            // Set Pagination
            setPaginationInfo();
        } catch(Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,e.getMessage()));
            return;
        }
    }
    
    /**
     * Page Last
     */
    public void pagesLast() {
        try {
            // Page Last
            this.tableResult.last();
            // Set Pagination
            setPaginationInfo();
        } catch(Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,e.getMessage()));
            return;
        }
    }

    /**
     * Page First
     */
    public void pagesFirst() {
        try {
            // Page First
            this.tableResult.first();
            // Set Pagination
            setPaginationInfo();
        } catch(Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,e.getMessage()));
            return;
        }
    }

    /**
     * Set Pagination Info
     */
    private void setPaginationInfo() {
        // Set pagination
        this.pagination.activePageNumber = getActivePageNumber();
        this.pagination.lastPageNumber = getLastPageNumber();
        this.pagination.isPagesPrevious = isPagesPrevious();
        this.pagination.isPagesNext = isPagesNext();
    }

    /**
     * Get Active Page
     */
    private Integer getActivePageNumber() {
        return this.tableResult.getPageNumber();
    }
    
    /**
     * Get Last Page
     */
    private Integer getLastPageNumber() {
        return this.helper.getLastPageNumber(this.tableResult.getResultSize(), this.tableResult.getPageSize());           
    }

    /**
     * Check Pages Previous
     */
    private Boolean isPagesPrevious() {
        return this.tableResult.getHasPrevious();
    }
    
    /**
     * Check Pages Next
     */
    private Boolean isPagesNext() {
        return this.tableResult.getHasNext();
    }
}