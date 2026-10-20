using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.BirthChart
{
    /// <summary>
    /// Query options for the Birth Chart API
    /// </summary>
    public class BirthChartQueryOptions
    {
        /// <summary>
        /// The birth date (YYYY-MM-DD or MM-DD-YYYY), between 1700 and 2200
        /// </summary>
        [JsonProperty("date")]
        public string Date { get; set; }

        /// <summary>
        /// The local birth time in 24-hour HH:mm format
        /// </summary>
        [JsonProperty("time")]
        public string Time { get; set; }

        /// <summary>
        /// The latitude of the birthplace
        /// </summary>
        [JsonProperty("lat")]
        public double Lat { get; set; }

        /// <summary>
        /// The longitude of the birthplace (east positive)
        /// </summary>
        [JsonProperty("lon")]
        public double Lon { get; set; }

        /// <summary>
        /// An IANA timezone name (America/New_York) or a UTC offset (+05:30). Looked up from the coordinates when omitted
        /// </summary>
        [JsonProperty("timezone")]
        public string Timezone { get; set; }

        /// <summary>
        /// The house system to use
        /// </summary>
        [JsonProperty("houseSystem")]
        public string HouseSystem { get; set; }
    }
}
