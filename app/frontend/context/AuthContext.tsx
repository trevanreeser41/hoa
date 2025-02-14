import { createContext, useContext, useState, useEffect } from 'react';
import { router } from 'expo-router';

interface AuthContextType {
  user: any | null;
  login: (token: string, userData: any) => void;
  logout: () => void;
}

const AuthContext = createContext<AuthContextType | null>(null);

export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [user, setUser] = useState<any | null>(null);

  const login = (token: string, userData: any) => {
    setUser(userData);
    // Store token in secure storage here
  };

  const logout = () => {
    setUser(null);
    // Clear token from storage
    router.replace('/login');
  };

  return (
    <AuthContext.Provider value={{ user, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
}

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
}; 