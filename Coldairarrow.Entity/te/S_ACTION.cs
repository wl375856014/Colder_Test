using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Coldairarrow.Entity.te
{
    /// <summary>
    /// S_ACTION
    /// </summary>
    [Table("S_ACTION")]
    public class S_ACTION
    {

        /// <summary>
        /// ACTIONID
        /// </summary>
        public String ACTIONID { get; set; }

        /// <summary>
        /// MODELID
        /// </summary>
        public String MODELID { get; set; }

        /// <summary>
        /// ACTIONCODE
        /// </summary>
        public String ACTIONCODE { get; set; }

        /// <summary>
        /// ACTIONNAME
        /// </summary>
        public String ACTIONNAME { get; set; }

        /// <summary>
        /// ISCOMMON
        /// </summary>
        public Int32? ISCOMMON { get; set; }

        /// <summary>
        /// MEMO
        /// </summary>
        public String MEMO { get; set; }

    }
}