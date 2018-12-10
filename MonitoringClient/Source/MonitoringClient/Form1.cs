using System;
using System.Data;
using System.Windows.Forms;
using MonitoringClient.Properties;
using MySql.Data.MySqlClient;

namespace MonitoringClient {
    public partial class Form1 : Form {
        public Form1() {
            InitializeComponent();
            if (!string.IsNullOrWhiteSpace(Settings.Default.ConnectionString)) {
                this.txtConnectionString.Text = Settings.Default.ConnectionString;
            }
        }

        private void btnLoadData_Click(object sender, EventArgs e) {
            try {
                this.LoadData();
            } catch (Exception ex) {
                MessageBox.Show("Es ist ein Fehler aufgetreten: " + ex.Message);
            }
        }

        private void LoadData() {
            this.lsvLogEntries.Items.Clear();
            using (var conn = new MySqlConnection(this.txtConnectionString.Text)) {
                conn.Open();
                using (var cmd = conn.CreateCommand()) {
                    cmd.CommandText = "select id, pod, location, hostname, severity, timestamp, message from v_logentries order by timestamp";
                    using (var reader = cmd.ExecuteReader()) {
                        while (reader.Read()) {
                            var item = lsvLogEntries.Items.Add(reader.GetValue(0).ToString());
                            for (var i = 1; i < 7; i++) {
                                var data = reader.GetValue(i);
                                item.SubItems.Add((data == null ? "" : data.ToString()));
                            }
                        }
                    }
                }
            }
        }

        private void btnLogClear_Click(object sender, EventArgs e) {
            try {
                using (var conn = new MySqlConnection(this.txtConnectionString.Text)) {
                    conn.Open();
                    foreach (ListViewItem row in this.lsvLogEntries.SelectedItems) {
                        using (var cmd = conn.CreateCommand()) {
                            cmd.CommandText = "LogClear";
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(row.SubItems[0].Text));
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
                this.LoadData();
            } catch (Exception ex) {
                MessageBox.Show("Es ist ein Fehler aufgetreten: " + ex.Message);
            }
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e) {
            Settings.Default.ConnectionString = this.txtConnectionString.Text;
            Settings.Default.Save();
        }
    }
}
