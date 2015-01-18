﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace API.Models
{
    public abstract class Chartable
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Fullname { get; set; }
        public string Slug { get; set; }
        public long SongCount { get; set; }
        public Decimal Score { get; set; }
        public string Tags { get; set; }
    }
}