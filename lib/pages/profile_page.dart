import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  final double _headerHeight = 200.0;
  final double _profilePicDiameter = 160.0;

  @override
  Widget build(BuildContext context) {
    final double profilePicOverlap = _profilePicDiameter / 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Profil'),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0, 
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildProfileHeader(context, profilePicOverlap),

          _buildUserNameSection(profilePicOverlap),

          _buildStatisticsCard(context),
          _buildInfoDetailsCard(context),

          _buildBackButton(context),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
  Widget _buildProfileHeader(BuildContext context, double profilePicOverlap) {
    return Container(
      height: _headerHeight + profilePicOverlap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildHeaderBackground(context),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0, 
            child: _buildProfileImage(),
          ),
        ],
      ),
    );
  }
  Widget _buildHeaderBackground(BuildContext context) {
    return Container(
      height: _headerHeight, 
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Colors.indigo.shade300,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: _profilePicDiameter,
        height: _profilePicDiameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 5.0, 
          ),
          color: Colors.grey.shade300, 
          image: DecorationImage(
            fit: BoxFit.cover,
            image: const AssetImage('assets/profil.jpeg'),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildUserNameSection(double paddingTop) {
    return Container(
      padding: EdgeInsets.only(
        top: paddingTop + 20.0, 
        left: 20.0,
        right: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Aril (Amiril Fatkhul Rohman)',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.grey[850],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            '23670069', // NIM
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email_outlined, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                'rohmanfatkhul946@gmail.com', // Email
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ],
          ),
          const Divider(height: 40, thickness: 1, indent: 20, endIndent: 20),
        ],
      ),
    );
  }
  Widget _buildStatisticsCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('IPK', '3.75', Colors.blue),
              _buildStatItem('SKS', '80', Colors.green),
              _buildStatItem('Hadir', '99,5%', Colors.orange),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
  Widget _buildInfoDetailsCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            _buildInfoTile(
              context,
              icon: Icons.school_outlined,
              title: 'Prodi',
              subtitle: 'Informatika',
            ),
            _buildInfoTile(
              context,
              icon: Icons.layers_outlined,
              title: 'Semester',
              subtitle: '5',
            ),
            _buildInfoTile(
              context,
              icon: Icons.calendar_today_outlined,
              title: 'Angkatan',
              subtitle: '2023',
            ),
            _buildInfoTile(
              context,
              icon: Icons.check_circle_outline,
              title: 'Status',
              subtitle: 'Aktif',
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildInfoTile(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[850],
        ),
      ),
    );
  }
  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          'Kembali ke Dashboard',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
} 