public with sharing class Big_AccountSearchPagination {
    
    public Integer activePageNumber {get; set;}
    public Integer lastPageNumber {get; set;}
    public Boolean isPagesPrevious {get; set;}
    public Boolean isPagesNext {get; set;}

    /**
     * Constructor
     */
    public Big_AccountSearchPagination() {
        this.activePageNumber = 1;
        this.lastPageNumber = 1;
        this.isPagesPrevious = false;
        this.isPagesNext = false;
    }
}