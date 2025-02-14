import { useAuth } from '../../hooks/useAuth';
import { Navigate } from 'expo-router';

interface ProtectedRouteProps {
  children: React.ReactNode;
  requireAdmin?: boolean;
}

export function ProtectedRoute({ children, requireAdmin }: ProtectedRouteProps) {
  const { user, isLoading } = useAuth();
  
  if (isLoading) {
    return <LoadingSpinner />;
  }
  
  if (!user) {
    return <Navigate href="/login" />;
  }
  
  if (requireAdmin && user.role !== 'admin') {
    return <Navigate href="/unauthorized" />;
  }
  
  return children;
} 