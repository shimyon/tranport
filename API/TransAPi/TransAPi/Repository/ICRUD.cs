namespace TransAPi.Repository
{
    interface ICRUD<T> where T : class
    {
        int Create(T newObj);
        bool Delete(int id);
        bool Update(T editObj);
        T Select(int id);
    }
}
