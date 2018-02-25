package paging;

public class Paging {
	 
	  private static Paging page = new Paging();
	 
	  private int startRow;		// 해당 페이지 첫번째 게시물 행번호
	  private int endRow;		// 해당 페이지 마지막 게시물 행번호
	  private StringBuffer sb;
	 
	  public Paging() {}
	   
	  public static Paging getInstance() {
	    if(page == null) {
	      page = new Paging();
	    }
	    return page;
	  }
	  
	  								//해당 페이지 번호, 총 게시글 수, 한 페이지에 보여줄 글 갯수, 하단에 보여줄 페이지 갯수, 게시판 주소  
	  public synchronized void paging(int pageNum, int totalCount, int pageSize, int pageBlock, String boardUrl) {
	    
		int totalPage = (int)Math.ceil((double)totalCount/pageSize);
	    startRow = (pageNum - 1) * pageSize + 1;
	    endRow = pageNum * pageSize;
	     
	    int startPage = (int)((pageNum - 1)/pageBlock) * pageBlock + 1;
	    int endPage = startPage + pageBlock - 1;
	     
	    if(endPage > totalPage) {
	      endPage = totalPage;
	    }
	     
	    sb = new StringBuffer();
	     
	    // Page클래스 변경 부분
	    if(startPage < pageBlock) {
	      sb.append("<li class='disabled'>"
	      		+ "<a href='#' aria-label='Previous'>"
	      		+ "<span aria-hidden='true'>&laquo;</span> </a></li>");
	    } else {
	      sb.append("<li class=''><a href='" + boardUrl + "?pageNum=");
	      sb.append(startPage - pageBlock);
	      sb.append("' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
	    }
	     
	    for(int i = startPage; i <= endPage; i++) {
	      if(i == pageNum) {
	        sb.append("<li class='active'><a href='" + boardUrl + "?pageNum=");
	        sb.append(i);
	        sb.append("'>");
	        sb.append("<span class='sr-only'>");
	        sb.append(i);
	        sb.append("</span></a></li>");
	      } else {
	        sb.append("<li class=''><a href='" + boardUrl + "?pageNum=");
	        sb.append(i);
	        sb.append("'>");
	        sb.append(i);
	        sb.append("<span class='sr-only'>");
	        sb.append(i);
	        sb.append("</span></a></li>");
	      }
	    }
	     
	    if(endPage < totalPage) {
	      sb.append("<li class=''><a href='" + boardUrl + "?pageNum=");
	      sb.append(startPage + pageBlock);
	      sb.append("' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
	    } else {
	      sb.append("<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
	    }
	  }
	   
	  public StringBuffer getSb() {
	    return sb;
	  }
	 
	  public int getStartRow() {
	    return startRow;
	  }
	 
	  public int getEndRow() {
	    return endRow;
	  }
	}

