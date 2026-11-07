import type { Metadata } from "next";
import "./globals.css";
export const metadata: Metadata = {
  title: "YANZ PREMIUMISME — Digital Store",
  description: "Temukan produk digital favoritmu dengan mudah, cepat, dan aman.",
  applicationName: "YANZ PREMIUMISME",
  appleWebApp: { capable: true, title: "YANZ PREMIUMISME", statusBarStyle: "black-translucent" },
};
export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return <html lang="id" data-theme="light"><body>{children}</body></html>;
}
