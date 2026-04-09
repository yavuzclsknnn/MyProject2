using System;
using System.Collections.Generic;
using System.Text;

namespace MyProject2.Repositories.Helpers
{
    public class PagedResult<T>
    {
        public List<T> Items { get; set; }
        public int TotalCount { get; set; }
        public int PageSize { get; set; }
        public int Page { get; set; }

        public int PageCount
        {
            get
            {
                if (PageSize == 0) return 0;
                return (int)Math.Ceiling((double)TotalCount / PageSize);
            }
        }

        public PagedResult()
        {
            Items = new List<T>();
        }
    }
}
