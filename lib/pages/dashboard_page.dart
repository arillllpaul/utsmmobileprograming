import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Dashboard Aplikasi'),
            floating: true, 
            pinned: true,
            snap: true, 
            elevation: 2.0,
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {
                },
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {

                },
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: _buildHeader(),
          ),

          SliverToBoxAdapter(
            child: _buildBannerUtama(),
          ),

          SliverToBoxAdapter(
            child: _buildSectionTitle(context, 'Menu Utama'),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: _buildMainMenuGrid(context),
          ),

          SliverToBoxAdapter(
            child: _buildSectionTitle(context, 'Aktivitas Cepat'),
          ),

          SliverToBoxAdapter(
            child: _buildQuickActionsList(context),
          ),

          SliverToBoxAdapter(
            child: _buildSectionTitle(context, 'Pengumuman Terbaru'),
          ),

          _buildAnnouncementsList(),

          const SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
        ],
      ),
    );
  }
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Halo, Aril',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Selamat datang kembali!',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerUtama() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Container(
        height: 180, 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), 
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          image: DecorationImage(
            image: const AssetImage('assets/rosblok.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.grey[850],
        ),
      ),
    );
  }

  Widget _buildMainMenuGrid(BuildContext context) {

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.0, 
      ),
      delegate: SliverChildListDelegate(
        [
          _buildMainMenuCard(
            context: context,
            icon: Icons.person_outline,
            label: 'Profil',
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          _buildMainMenuCard(
            context: context,
            icon: Icons.list_alt_outlined,
            label: 'Data',
            onTap: () {},
          ),
          _buildMainMenuCard(
            context: context,
            icon: Icons.settings_outlined,
            label: 'Pengaturan',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMainMenuCard({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Theme.of(context).primaryColor),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionsList(BuildContext context) {
    return Container(
      height: 120, 
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        children: [
          _buildQuickActionCard(
            context,
            icon: Icons.add_card,
            label: 'Isi Data',
            colors: [Colors.indigo, Colors.blue],
          ),
          _buildQuickActionCard(
            context,
            icon: Icons.calendar_month,
            label: 'Jadwal',
            colors: [Colors.deepOrange, Colors.orangeAccent],
          ),
          _buildQuickActionCard(
            context,
            icon: Icons.email_outlined,
            label: 'Pesan',
            colors: [Colors.green, Colors.tealAccent.shade400],
          ),
          _buildQuickActionCard(
            context,
            icon: Icons.help_outline,
            label: 'Bantuan',
            colors: [Colors.purple, Colors.pinkAccent],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionCard(BuildContext context,
      {required IconData icon,
      required String label,
      required List<Color> colors}) {
    return Container(
      width: 140, 
      margin: const EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colors.first.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, size: 30, color: Colors.white),
                Text(
                  label,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildAnnouncementsList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final List<Map<String, dynamic>> announcements = [
            {
              'title': 'Jadwal Ujian Akhir Semester',
              'subtitle': 'Jangan lupa periksa jadwal dan ruang ujian...',
              'icon': Icons.school_outlined
            },
            {
              'title': 'Maintenance Sistem SPADA',
              'subtitle': 'SPADA akan nonaktif pada hari Minggu...',
              'icon': Icons.warning_amber_rounded
            },
            {
              'title': 'Info Beasiswa 2026',
              'subtitle': 'Pendaftaran beasiswa telah dibuka...',
              'icon': Icons.card_giftcard
            },
          ];

          final item = announcements[index];
          return _buildAnnouncementCard(
            context,
            title: item['title'],
            subtitle: item['subtitle'],
            icon: item['icon'],
          );
        },
        childCount: 3,
      ),
    );
  }
  Widget _buildAnnouncementCard(BuildContext context,
      {required String title,
      required String subtitle,
      required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Icon(icon, color: Theme.of(context).primaryColor),
          ),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
          },
        ),
      ),
    );
  }
} 