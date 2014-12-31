using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Azure.WebJobs;

namespace UpdateScoresWebjob
{
    // To learn more about Microsoft Azure WebJobs SDK, please see http://go.microsoft.com/fwlink/?LinkID=320976
    class Program
    {
        static void Main()
        {

            SqlConnection conn = API.SongChartsDatabase.Connection();
            SqlCommand command;

            //TODO Get the updated data from Wikidot and put it in the DB.
            // Otherwise, assumes that we have already uploaded data from Wikidot.

            // Extract ranking information into the SongRanks table.
            command = new SqlCommand("dbo.FillSongRanks", conn);
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 200;
            command.ExecuteNonQuery();

            // Complete all of the ranking information.
            command = new SqlCommand("dbo.ProjectRanks", conn);
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 200;
            command.ExecuteNonQuery();

            // Total and store song scores.
            command = new SqlCommand("dbo.Songs_Score", conn);
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 200;
            command.ExecuteNonQuery();

            // Total and store artist scores.
            command = new SqlCommand("dbo.Artists_Score", conn);
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 200;
            command.ExecuteNonQuery();
        }
    }
}
