package com.tiarebalbi.kupo.dto;

import java.util.List;

/**
 * Data source request
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.dto
 * @since 1.0.0
 * 
 */
public class KendoDataSource {
	
    private int page;
    private int pageSize;
    private int take;
    private int skip;
    
    private Filtro filter;
    
    /**
	 * @return the page
	 */
	public int getPage() {
		return page;
	}



	/**
	 * @param page the page to set
	 */
	public void setPage(int page) {
		this.page = page;
	}



	/**
	 * @return the pageSize
	 */
	public int getPageSize() {
		return pageSize;
	}



	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}



	/**
	 * @return the take
	 */
	public int getTake() {
		return take;
	}



	/**
	 * @param take the take to set
	 */
	public void setTake(int take) {
		this.take = take;
	}



	/**
	 * @return the skip
	 */
	public int getSkip() {
		return skip;
	}



	/**
	 * @param skip the skip to set
	 */
	public void setSkip(int skip) {
		this.skip = skip;
	}



	/**
	 * @return the filter
	 */
	public Filtro getFilter() {
		return filter;
	}



	/**
	 * @param filter the filter to set
	 */
	public void setFilter(Filtro filter) {
		this.filter = filter;
	}



	/**
     * Filtros
     * 
     * @author Tiarê Balbi Bonamini
     * @package com.tiarebalbi.kupo.dto
     * @since 1.0.0
     * 
     */
    public static class Filtro {
    	
    	 private String logic;
         private List<Filtro> filters;        
         private String field;
         private String value;        
         private String operator;
         private boolean ignoreCase = true;
		/**
		 * @return the logic
		 */
		public String getLogic() {
			return logic;
		}
		/**
		 * @param logic the logic to set
		 */
		public void setLogic(String logic) {
			this.logic = logic;
		}
		/**
		 * @return the filters
		 */
		public List<Filtro> getFilters() {
			return filters;
		}
		/**
		 * @param filters the filters to set
		 */
		public void setFilters(List<Filtro> filters) {
			this.filters = filters;
		}
		/**
		 * @return the field
		 */
		public String getField() {
			return field;
		}
		/**
		 * @param field the field to set
		 */
		public void setField(String field) {
			this.field = field;
		}
		/**
		 * @return the value
		 */
		public String getValue() {
			return value;
		}
		/**
		 * @param value the value to set
		 */
		public void setValue(String value) {
			this.value = value;
		}
		/**
		 * @return the operator
		 */
		public String getOperator() {
			return operator;
		}
		/**
		 * @param operator the operator to set
		 */
		public void setOperator(String operator) {
			this.operator = operator;
		}
		/**
		 * @return the ignoreCase
		 */
		public boolean isIgnoreCase() {
			return ignoreCase;
		}
		/**
		 * @param ignoreCase the ignoreCase to set
		 */
		public void setIgnoreCase(boolean ignoreCase) {
			this.ignoreCase = ignoreCase;
		}
         
    }

}
