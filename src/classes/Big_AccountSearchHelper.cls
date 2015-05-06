public with sharing class Big_AccountSearchHelper {

    /**
     * Constructor
     */
    public Big_AccountSearchHelper() {
        
    }

    /**
     * Get Last Page
     */
    public Integer getLastPageNumber(Integer resultSize, Integer pageSize) {
        
        if (resultSize == null || pageSize == null) {
            return null;
        }
        
        if (resultSize == 0 && pageSize == 0) {
            return 0;
        }

        Integer pgMax = resultSize / pageSize;        
        if (math.mod(resultSize, pageSize) > 0) {
            pgMax++;
        }
        
        return pgMax;           
    }
}