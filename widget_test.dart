// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Ganti 'nama_project_anda' dengan nama folder project Anda
// Ganti 'nama_project_anda' dengan nama folder project Anda
import 'package:flutters_app/main.dart';
import 'package:flutters_app/pages/login_page.dart';
import 'package:flutters_app/pages/dashboard_page.dart';
import 'package:flutters_app/pages/profile_page.dart';
void main() {
  testWidgets('Test Alur Navigasi Lengkap UTS AMP', (WidgetTester tester) async {
    // 1. Jalankan aplikasi (Mulai di Halaman Login)
    await tester.pumpWidget(const MyApp()); // Asumsi kelas utama Anda adalah MyApp di main.dart

    // --- PENGUJIAN HALAMAN LOGIN ---

    // Verifikasi Halaman Login muncul
    expect(find.text('Selamat Datang'), findsOneWidget); // 
    expect(find.text('Login'), findsOneWidget);

    // Tes Validasi (gagal login jika kosong) 
    await tester.tap(find.text('Login'));
    await tester.pump(); // Tampilkan snackbar/pesan error

    // Pastikan kita MASIH di halaman Login
    expect(find.text('Selamat Datang'), findsOneWidget);
    // (Opsional) Verifikasi pesan error muncul
    // expect(find.text('Username dan Password tidak boleh kosong!'), findsOneWidget);
    
    // ---
    
    // Tes Login Berhasil
    // Masukkan teks ke TextFields [cite: 26]
    await tester.enterText(find.byType(TextField).at(0), 'user@test.com');
    await tester.enterText(find.byType(TextField).at(1), 'password');
    
    // Tekan tombol Login [cite: 27]
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle(); // Tunggu animasi navigasi selesai

    // --- PENGUJIAN HALAMAN DASHBOARD ---

    // Verifikasi Halaman Dashboard muncul
    expect(find.text('Dashboard Aplikasi'), findsOneWidget); // [cite: 31]
    expect(find.text('Halo, Andi'), findsOneWidget); // 
    
    // Cari tombol/menu "Profil" [cite: 34, 37]
    final profilMenuFinder = find.widgetWithText(InkWell, 'Profil'); // Asumsi pakai InkWell
    expect(profilMenuFinder, findsOneWidget);

    // Tekan menu "Profil" [cite: 38]
    await tester.tap(profilMenuFinder);
    await tester.pumpAndSettle(); // Tunggu navigasi

    // --- PENGUJIAN HALAMAN PROFIL ---

    // Verifikasi Halaman Profil muncul
    expect(find.text('Halaman Profil'), findsOneWidget);
    expect(find.text('Andi (Amiril Fatkhul Rohman)'), findsOneWidget); // [cite: 41]
    
    // Cari tombol "Kembali" [cite: 44]
    final kembaliButtonFinder = find.text('Kembali ke Dashboard');
    expect(kembaliButtonFinder, findsOneWidget);

    // Tekan tombol "Kembali" [cite: 44]
    await tester.tap(kembaliButtonFinder);
    await tester.pumpAndSettle(); // Tunggu navigasi (pop)

    // --- PENGUJIAN KEMBALI KE DASHBOARD ---

    // Verifikasi kita kembali ke Halaman Dashboard
    expect(find.text('Dashboard Aplikasi'), findsOneWidget); // [cite: 31]
    expect(find.text('Halaman Profil'), findsNothing); // Pastikan Halaman Profil sudah tertutup
  });
}